// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorGamesDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$GamesDatabaseBuilder databaseBuilder(String name) =>
      _$GamesDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$GamesDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$GamesDatabaseBuilder(null);
}

class _$GamesDatabaseBuilder {
  _$GamesDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$GamesDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$GamesDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<GamesDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$GamesDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$GamesDatabase extends GamesDatabase {
  _$GamesDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  GamesDbDAO _gamesDbDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `GameDb` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `coverId` TEXT, `description` TEXT, `rating` REAL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  GamesDbDAO get gamesDbDAO {
    return _gamesDbDAOInstance ??= _$GamesDbDAO(database, changeListener);
  }
}

class _$GamesDbDAO extends GamesDbDAO {
  _$GamesDbDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _gameDbInsertionAdapter = InsertionAdapter(
            database,
            'GameDb',
            (GameDb item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'coverId': item.coverId,
                  'description': item.description,
                  'rating': item.rating
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GameDb> _gameDbInsertionAdapter;

  @override
  Future<List<GameDb>> retrieveGames() async {
    return _queryAdapter.queryList('SELECT * FROM GameDb',
        mapper: (Map<String, dynamic> row) => GameDb(
            id: row['id'] as int,
            name: row['name'] as String,
            coverId: row['coverId'] as String,
            description: row['description'] as String,
            rating: row['rating'] as double));
  }

  @override
  Future<void> insertGames(List<GameDb> games) async {
    await _gameDbInsertionAdapter.insertList(games, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertOneGame(GameDb game) async {
    await _gameDbInsertionAdapter.insert(game, OnConflictStrategy.abort);
  }
}
